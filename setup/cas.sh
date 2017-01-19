CAS_USER=jpg29
CAS_VM_IP=10.243.46.67
CAS_OPSKEY_PATH="~/.ssh/opskey_rsa"
alias vm"=ssh -i ${CAS_OPSKEY_PATH} ${CAS_USER}@${CAS_VM_IP}"
alias uvm"=ssh -i ${CAS_OPSKEY_PATH} ubuntu@${CAS_VM_IP}"

# Git
alias g.lsp='git ls-projects'
alias g.jp='git join-project'

# OpenStack
function os() {
    export OS_PROJECT_NAME=$1
    export OS_TENANT_NAME=$1
}

alias nln='nova list --name'

