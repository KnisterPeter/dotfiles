#!/usr/bin/env bash

if which minikube > /dev/null ; then
    # shellcheck disable=SC1090
    source <(minikube completion bash)

    alias mkubectl='minikube kubectl'
fi
