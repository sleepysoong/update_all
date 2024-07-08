#!/bin/bash

update_repos() {
    for dir in "$1"/*; do
        if [ -d "$dir" ]; then
            if [ -d "$dir/.git" ]; then
                echo "   - 업데이트를 시도합니다: $dir"
                cd "$dir" || continue
                git pull
                cd - > /dev/null
            else
                update_repos "$dir"
            fi
        fi
    done
}

echo "[!] 업데이트를 시작합니다"
echo "=================================================================================================="
update_repos .
echo "=================================================================================================="
echo "[!] 업데이트를 종료합니다"
