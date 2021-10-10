function e -a 'filename'
    if test -n "$filename"
    else
        set filename ".env"
    end

    if test $filename
        sed -E -n 's/[^#]+/export &/ p' $filename | source
    else
        echo "File $filename not found";
    end
end
