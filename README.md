## Testing Digital Ocean for small projects
## Version 1.0
### Provider
The provider can be authenticated using personal token as a `env` variable or with the use of `tfvars` file and letting `.gitignore` file exclude the same to avoid any secret / API Key leak

In order to allow terraform commands use the file, the following command should be executed
```
terraform plan -var-file="input.tfvars"
```
To apply this infra you must choose the type of `droplet` based on the model. I strongly suggest ran this command 
```
terraform apply -var-file="input.tfvars" --auto-approve
```


#### Options
Using `env` variable
`export DO_PAT="your_personal_access_token"`
Using `tf.vars` file
`token = XXXXXX`

### Pending / In progress
- Create `digitalocean_vpc` resources and use attributes on `droplet` resources (DONE)
- Create `resource`  with a `SSH` public key using [this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/ssh_key) resource with a generated SSH local key (DONE)
- It will be at least two or four ways to create the `droplet` using the same `resource`. The latest will create several `droplets` using the results from `data digitalocean_regions` on multiple regions. [Check this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/regions) --- (DONE IT USING FIXED LIST)
- Include a way to dynamically generate the list using the data from `data digitalocean_regions` (DONE)
- Include `tags`, `user_data`, `droplet_agent`, `ssh_keys` and `vpc_uuid` argument for the creation of the `droplets` (The third one) (TAGS DONE, STILL USER DATA MISSING)
- Review the best way to pass `image` and `size` for `droplet`. For sizes, images and other values we have this [references](https://slugs.do-api.dev/) to check later (TO BE DONE)
- Some `outputs` attributes from `data data digitalocean_region` has been included to understand how to use the `filters` on the `data digitalocean_regions` resource. (NEW OUTPUT FOR THE DATA RESOURCES REGIONS HAS BEEN CREATED)
- Modify the `name` expression for the `droplet` resource using probably tags or other variables to demonstrate an example (DONE)
- Create the code to create dinamically the tags instead individual blocks for each  `digitalocean_tag` resource. Map variable and `for_each` meta argument. (TO BE DONE)

### Note
Still some work to do, let's release this first version. 