if !(type "{{__input__:cmd_name}}" > /dev/null 2>&1); then
    echo "{{__input__:cmd_name}} isn't installed!!"
    exit 1
fi
