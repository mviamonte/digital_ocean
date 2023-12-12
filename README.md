## Testing Digital Ocean for small projects
## Version 1.0
### Provider
The provider can be authenticated using personal token as a `env` variable or with the use of `input.tfvars` file and letting `.gitignore` file exclude it to avoid any secret / API Key leak

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
Using `input.tfvars` file
`token = XXXXXX`

### Index of projects
For deployment of droplets, using different approaches
Under droplets you will find
- single-deployment (no `variables`, literals arguments)
- exportable-deployment ( using static input`variables`)
- multizone-static-zones (`variables` an dynamic expression using meta arguments with fixed variable values)
- multizone-dynamic-zones (`variables` an dynamic expression using meta arguments with data filtered values)
- for-load-balancing (using `variables` and dynamic single region to use it with `load-balancer` project)

For VPC deployment for the `multizone-dynamic-zones`
Under networking directory
- vpc (common VPC resources for the `droplets` resources)
- load_balancer (join use with `load-balancer` for a functional deployment)

### Changelog / activities task
- Create `digitalocean_vpc` resources and use attributes on `droplet` resources
- Create `resource`  with a `SSH` public key using [this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/ssh_key) resource with a generated SSH local key
- It will be at least two or four ways to create the `droplet` using the same `resource` terraform type. Some of them will create several `droplets` using the results from `data digitalocean_regions` on multiple regions. [Check this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/regions)
- Include a way to dynamically generate the list using the data from `data digitalocean_regions`
- Include `tags`, `user_data`, `droplet_agent`, `ssh_keys` and `vpc_uuid` argument for the creation of the `droplets`

- Use`name` expression for the `droplet` resource using probably tags or other variables to demonstrate an example.
- Refactor the code to create dinamically the tags instead individual blocks for each  `digitalocean_tag` resource. Map variable and `for_each` meta argument. (DONE)

### Notes
- This is the final version of the project.  

## Tip about the code 
### About locals.tf
- The creation of the `dynamic-regions` locals resource give us a `tuple` with the slug of the available regions with the features specified on the `data.digitalocean_regions` resource. 
- For the `VPC data resource` I'm using the same logic base on the same `local` value. 
`VPC` resources are created isolated with a single `subnet` in the corresponding folder
### Some ugly expressions
- I have enforce the use of the first element of a list with the deployment of the `load-balancer` to use the current dynamic values associated with the `regions` and the `vpc-uuid`

### Extra outputs

- Some `outputs` attributes from `data digitalocean_region` has been included to understand how to use the `filters` on the `data digitalocean_regions` resource.

### Variable use
- Each project has an empty definition of the variable `do_token`
- To deploy the `load balancer` and provide som of the nested block such as `forwarding_rule` and `healthcheck`, I'm using map variable, access to its elements and `keys` function to obtain some of the values. Not sure if this is the best way to do it, but it works.  
## To review or improve
### Load balancer
After the deployment of the `load balancer` some of the droplets weren't on healthy status, however the independent `droplet` was in OK status. I haven't investigate it further
### Droplet selection (Load Balancer project)
In order to select some of the deployed droplet (`roplet_ids` argument), I have used the `data "digitalocean_droplets"` resource using the `webserver` key filter tag. This should be improved, creating an specific tag for this purpose. There is also a way to pass the tags (argument) directly to the `resource "digitalocean_loadbalancer" ` resource

### Remote state
This project doesn't use the resource of the remote state, which will improve the use of the data resources. However, this was for only illustrative purposes. 
### SSH
You need to modify the `resource "digitalocean_ssh_key"` with your own `SSH` key or refactor this code and pass to the `droplets` resources  