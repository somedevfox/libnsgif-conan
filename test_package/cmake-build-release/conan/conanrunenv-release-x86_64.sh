echo Capturing current environment in deactivate_conanrunenv-release-x86_64.sh
echo echo Restoring environment >> deactivate_conanrunenv-release-x86_64.sh
for v in PATH LD_LIBRARY_PATH DYLD_LIBRARY_PATH DYLD_FRAMEWORK_PATH
do
    value=$(printenv $v)
    if [ -n "$value" ]
    then
        echo export "$v=$value" >> deactivate_conanrunenv-release-x86_64.sh
    else
        echo unset $v >> deactivate_conanrunenv-release-x86_64.sh
    fi
done

echo Configuring environment variables

export PATH="$PATH"
export LD_LIBRARY_PATH="/home/somedevfox/.conan/data/libnsgif/1.0/demo/testing/package/82ef5eac51c38971dea2fd342dd55ddf2ddfbbc3/lib:$LD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/home/somedevfox/.conan/data/libnsgif/1.0/demo/testing/package/82ef5eac51c38971dea2fd342dd55ddf2ddfbbc3/lib:$DYLD_LIBRARY_PATH"
export DYLD_FRAMEWORK_PATH="$DYLD_FRAMEWORK_PATH"