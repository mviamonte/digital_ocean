## Testing Digital Ocean for small projects
## Version 1.0
### Provider
The provider can be authenticated using personal token as a `env` variable or with the use of `tfvars` file and letting `.gitignore` file exclude the same to avoid any secret / API Key leak

On each project / folder based on the needs, the way to plan the resources to be deployed is using
```
terraform plan -var-file="../../input.tfvars"
```
On each project / folder based on the needs, the way to plan the resources to be deployed is using
```
terraform apply -var-file="../../input.tfvars" --auto-approve
```
From any directory checking the relative path

## Version 1.1 
Using user data with `cloud-init` format. 
Still need to verify if the rule for OpenSSH is working to enable automatically the Firewall for the SSH console. 

## Version 2.0 
All the `tags` resources has been refactored
The projects has been isolated under `droplets` directory

#### Options
Using `env` variable
`export DO_PAT="your_personal_access_token"`
Using `tf.vars` file
`token = XXXXXX`

### Index of projects
For deployment of droplets, using different approaches
Under droplets you will find
- single-deployment
- exportable-deployment
- multizone-static-zones
- multizone-dynamic-zones

For VPC deployment for the `multizone-dynamic-zones`
Under networking directory
- vpc
- load_balancer (not deployed yet)
### Pending / In progress
- Create `digitalocean_vpc` resources and use attributes on `droplet` resources (DONE)
- Create `resource`  with a `SSH` public key using [this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/ssh_key) resource with a generated SSH local key (DONE)
- It will be at least two or four ways to create the `droplet` using the same `resource`. The latest will create several `droplets` using the results from `data digitalocean_regions` on multiple regions. [Check this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/regions) --- (DONE IT USING FIXED LIST)
- Include a way to dynamically generate the list using the data from `data digitalocean_regions` (DONE)
- Include `tags`, `user_data`, `droplet_agent`, `ssh_keys` and `vpc_uuid` argument for the creation of the `droplets` (The third one) (DONE)
- Review the best way to pass `image` and `size` for `droplet`. For sizes, images and other values we have this [references](https://slugs.do-api.dev/) to check later (NOT GONNA HAPPEN)
- Some `outputs` attributes from `data data digitalocean_region` has been included to understand how to use the `filters` on the `data digitalocean_regions` resource. (DONE)
- Modify the `name` expression for the `droplet` resource using probably tags or other variables to demonstrate an example (DONE)
- Create the code to create dinamically the tags instead individual blocks for each  `digitalocean_tag` resource. Map variable and `for_each` meta argument. (DONE)

### Note
Still some work to do, let's release this first version. 

## Tip about the code -- locals.tf
The creation of the `dynamic-regions` locals give us a `tuple` with the slug of the available regions with the features specified on the `data.digitalocean_regions` resource. 

For the `VPC data resource` I'm using the same logic base on the same `local` value. 
`VPC` resources are created isolated with a single `subnet` in the corresponding folder

## To review
Droplets are being deployed on the default VPC instead of the custom (FIXED)