# SE Lab Dec 9, 2019

* Deploy virtual machines (OVA/OVF/VMX) to ESXI using terraform _without the vSphere licensing/api_

This lab refers to this excellent [prior art](https://github.com/josenk/terraform-provider-esxi)

**Caution:** password chars typed at prompts will be echoed when `terraform plan` is run.
See [this](https://www.linode.com/docs/applications/configuration-management/secrets-management-with-terraform/) discussion for some workarounds.
**Caution:** contents of terraform.tfvars contains plain text copies of passwords. Do not include these in version control!

### Lab steps

1. Visit the prior art link above and build/install everything as directed

2. Clone this repo to a local folder: `git clone https://github.com/tyson312/terraform-esxi-lab

3. Create a file `terraform.tfvars` in this same folder, to store the esxi password. **Do NOT check this file into version control or you risk exposing this password to the internet!** 

The contents of this file is as follows (change dummy to the actual plaintext password):

```bash
esxi_password = "dummy"
```

4. Grab a linux image (ova/ovf) to deploy and save it locally, and edit `main.tf` to use this file. Alternatively, use [ubuntu cloud images](https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64.ova) -- copy that link and put it in `main.tf` as the ovf_source

5. now we terraform!

``` bash
terraform init
terraform plan
terraform apply
terraform show
terraform destroy
```
