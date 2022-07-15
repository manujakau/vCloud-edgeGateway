## vCloud-edgeGateway

### Prerequisites (Ubuntu platform)
Setup Terraform 
```
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

Setup Powershell
```
sudo apt update -y  && sudo apt install -y wget apt-transport-https software-properties-common
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update && sudo apt install -y powershell
```

Setup PowerCLI
```
pwsh
Install-Module -Name VMware.PowerCLI
```

Get free ip to assign in terraform script
```
pwsh ./scripts/findFreeIP.ps1 <vcloud_url> <vcloud_user> <vcloud_password> <tire0gateway_name>
```

Deploy Infrastrcture
```
terraform init
terraform plan .
terraform apply .
```
