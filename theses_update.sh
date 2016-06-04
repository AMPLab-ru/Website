#!/bin/sh

selfpath=`dirname $0`
thesesdir="theses"
articles="$selfpath/html/$thesesdir"

print_article_name() {
	echo "| $(basename $1)"
}

print_article_description() {
	local file

	file=`ls $1/*.README`
	echo -n "| "

	test -f $file && cat $file

	echo ""
}

print_article_files() {
	local base

	echo -n "| "
	base=`basename $1`

	for item in $(ls $1/ | grep -v ".README$"); do
		echo "link:$thesesdir/$base/$item[$item]"
		echo "+ "
	done

	echo ""
}

cat << EOF
Курсовые и ВКР студентов лаборатории
====================================

[width="100%", cols="^25%,^50%,^25%", frame="all", grid="all", options="header"]
|=================================
|Работа	|Описание  |Файлы
EOF

for item in $articles/*; do
	print_article_name $item
	print_article_description $item
	print_article_files $item
done

cat << EOF
|=================================
EOF

