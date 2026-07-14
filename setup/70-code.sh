#!/usr/bin/env bash

if [ -n "$CODESPACES" ] ; then
    echo -n "Configure Codespaces ... "

    if which code > /dev/null ; then
        echo -n "  🔹 vscode"
        printed=0

        expected=(
            "github.codespaces"
            "github.vscode-pull-request-github"
            "streetsidesoftware.code-spell-checker"
            "editorconfig.editorconfig"
            "dbaeumer.vscode-eslint"
            "github.vscode-github-actions"
            "ms-azuretools.vscode-containers"
            "denoland.vscode-deno"
            "streetsidesoftware.code-spell-checker"
        )
        installed="$(code --list-extensions)"

        for ext in "${expected[@]}"; do
            # literal match is expected
            # shellcheck disable=SC2076
            if [[ ! "$installed" =~ "$ext" ]]; then
                if [[ $printed -eq 0 ]]; then
                    echo " installing extensions:"
                    printed=1
                fi

                echo "      - $ext"
                code --install-extension "$ext" > /dev/null 2>&1
            fi
        done

        if [[ $printed -eq 0 ]]; then
            echo ""
        fi
    fi

    echo "✔️"
fi
