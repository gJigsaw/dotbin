CAS_USER=jpg29
CAS_VM_IP=10.243.46.67
CAS_OPSKEY_PATH="~/.ssh/opskey_rsa"
alias vm"=ssh -i ${CAS_OPSKEY_PATH} ${CAS_USER}@${CAS_VM_IP}"
alias uvm"=ssh -i ${CAS_OPSKEY_PATH} ubuntu@${CAS_VM_IP}"
