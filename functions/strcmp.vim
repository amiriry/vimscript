function! Strcmp(str1, str2)
    " Checks case sensitivly if the strings sent are equal
    if a:str1 ==# a:str2
	echo a:str1 . "and " . a:str2 . "are equal and in the same case"
    " Checks case insensitivly if the strings sent are equal
    elseif a:str1 ==? a:str2
	echo a:str1 . " and " . a:str2 . " are the same in different cases"
    " if non of the above happens then they are not equals
    else
 	echo "strings are not equal"
    endif
endfunction!

nnoremap <leader>cmp :call Strcmp("<c-r>a","<c-r>b")<CR>
