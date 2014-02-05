#include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <string.h>
#include <sys/select.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

static int
spawn(const char *file, char *const argv[])
{
	pid_t pid;

	pid = fork();
	if (pid < 0)
		return pid;
	if (pid == 0) {
		setsid();
		setpgid(0, 0);
		execvp(file, argv);
		_exit(errno == ENOENT ? 127 : 126);
	}
}

int
main(void)
{
	const char *fifopath = "/var/run/init.fifo";
	sigset_t set;
	pid_t pid;
	fd_set rfds;
	char buf[BUFSIZ], *p;
	int c;
	int fd;
	int n;

	if (getpid() != 1) return 1;

	sigfillset(&set);
	sigprocmask(SIG_BLOCK, &set, 0);

	pid = fork();
	if (pid < 0) return 1;
	if (pid > 0) for (;;) wait(&c);

	sigprocmask(SIG_UNBLOCK, &set, 0);

	spawn("/bin/sh", (char *[]){ "sh", "-c", "/etc/rc", NULL });

	unlink(fifopath);
	umask(0);
	mkfifo(fifopath, 0600);
	fd = open(fifopath, O_RDWR | O_NONBLOCK);
	while (1) {
		FD_ZERO(&rfds);
		FD_SET(fd, &rfds);
		n = select(fd + 1, &rfds, NULL, NULL, NULL);
		if (n <= 0)
			continue;
		if (FD_ISSET(fd, &rfds)) {
			n = read(fd, buf, sizeof(buf) - 1);
			if (n < 0 || n == 0)
				continue;
			buf[n] = '\0';
			p = strchr(buf, '\n');
			if (p) *p = '\0';
			if (strcmp(buf, "reboot") == 0) {
				spawn("/bin/sh", (char *[]){
						"sh",
						"-c",
						"/etc/rc.shutdown reboot",
						NULL
				});
			}
			if (strcmp(buf, "poweroff") == 0) {
				spawn("/bin/sh", (char *[]){
						"sh",
						"-c",
						"/etc/rc.shutdown poweroff",
						NULL
				});
			}
		}
	}

	/* unreached */
	return 0;
}
