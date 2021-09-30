function e
    sed -E -n 's/[^#]+/export &/ p' ./.env | source
end
