" Create full class with supplying class_name and fields 
" Cretae __init__ and getters and setters for each field
function! CreateFullClass(c_name, ...)
	let @b = a:c_name
	let n = 1
	exec "normal iclass :\<Esc>h\"bpodef __init__(self):\<Enter>\<Enter>\<C-d>#getters\<Enter>\<Enter>#setters\<Enter>\<Enter>#methods"
	echo a:000
	for s in a:000
		let @m = s
		exec "normal /\<c-r>b\<Enter>"
		exec "normal /init\<Enter>f)i,\<Esc>\"mpoself.\<Esc>\"mpa = \<Esc>\"mp"
		exec "normal /getters\<Enter>odef get_\<c-r>m(self):\<Enter>return self.\<c-r>m"
		exec "normal /setters\<Enter>odef set_\<c-r>m(self,\<c-r>m):\<Enter>self.\<c-r>m = \<c-r>m"
	endfor
endfunction!

" Create class only with __init__ function - input: class name and fields
function! CreateClassInitOnly(c_name, ...)
	let @b = a:c_name
	let n = 1
	exec "normal iclass :\<Esc>h\"bpodef __init__(self):\<Enter>\<Enter>\<C-d>#methods\<Esc>"
	for s in a:000
		let @m = s
		exec "normal /\<c-r>b\<Enter>"
		exec "normal /init\<Enter>f)i,\<Esc>\"mpoself.\<Esc>\"mpa = \<Esc>\"mp"
	endfor
endfunction!

" Add a field to class. Input: class_name and field_name
function! FullFieldToClass(class_name, field_name)
	let @c = a:class_name
	let @m = a:field_name
	exec "normal /\<c-r>c\<Enter>/init\<Enter>f)i,\<Esc>\"mpoself.\<Esc>\"mpa = \<Esc>\"mp"
	exec "normal /getters\<Enter>odef get_\<c-r>m(self):\<Enter>return self.\<c-r>m"
	exec "normal /setters\<Enter>odef set_\<c-r>m(self,\<c-r>m):\<Enter>self.\<c-r>m = \<c-r>m"
endfunction!

" Add method to class. Input: Class - the class you want to add too, mtd_name - the method you want to add. After it its parameters
function! AddMethod(class,mtd_name, ...)
	let @b = a:class
	let @c = a:mtd_name

	exec "normal /class \<c-r>b\<Enter>"
	exec "normal /#methods\<Enter>odef \<c-r>c(self):\<Esc>^"
	for s in a:000
		let @m = s
		exec "normal f)i,\<c-r>m\<Esc>^"
	endfor
    exec "normal o"
endfunction!

" If file have only one class init, can use this to add class
function! AddMethodClassFile(m_name, ...)
	let @b = a:m_name
	exec "normal G2o\<Esc>i\<Tab>def :\<Esc>h\"bpa()\<Esc>^"
	let n = 0
	for s in a:000
		let @m = s
		if n == 0
			exec "normal f)i\<c-r>m\<Esc>^"
		else
			exec "normal f)i,\<c-r>m\<Esc>^"
		endif
		let n += 1
	endfor
	exec "normal o"
endfunction



