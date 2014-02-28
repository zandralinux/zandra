	cp $top/pkgs/$target $top/.state/$target

fetch-target:QP./stuff/cmp-fetch: .
	cd src
	pkg=`echo $target | sed -e 's,-fetch$,,'`
	eval url=$url
	if test "$url" = ""; then
		if test "$git" = ""; then
			echo $target: nothing to download
		else
			[ -d $pkg ] || git clone $git $pkg
		fi
	else
		wget -c $url
		file=`basename $url`
		type=`file -b $file | cut -d ' ' -f 1`
		if test "$type" = "gzip"; then
			tar -xzf $file
		elif test "$type" = "bzip2"; then
			tar -xjf $file
		elif test "$type" = "XZ"; then
			tar -xJf $file
		fi
	fi
	cp $top/pkgs/$pkg $top/.state/$target

