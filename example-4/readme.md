# TerraWeb: AWS S3 Static Website Deployment with Terraform

TerraWeb is a Terraform project designed to simplify the deployment and management of static websites on Amazon S3. Utilizing Terraform's declarative approach, this project streamlines the provisioning of AWS resources, allowing users to effortlessly host their static websites.

## Features

- **Infrastructure as Code (IaC):** Manage your entire AWS S3 hosting infrastructure using Terraform code, ensuring consistency and reproducibility.

- **Seamless Deployment:** Simplify the process of deploying static websites on Amazon S3 with a few easy steps.

- **Ownership Controls:** Easily configure ownership controls, access policies, and website settings using Terraform's intuitive syntax.

## Usage

1. Install Terraform: Make sure Terraform is installed on your local machine. [Download Terraform](https://www.terraform.io/downloads.html).

2. Clone the Repository: Clone this repository to your local machine.

    ```bash
    git clone https://github.com/GadagojuShiva/terraform_examples.git
    cd example-4
    ```

3. Configure Variables: Update the `variables.tf` file with your desired settings, including the `bucket_name` 
`region` and file paths for your website content.

4. Initialize and Apply: Run Terraform commands to initialize and apply the configuration.

    ```bash
    terraform init
    terraform apply
    ```

5. Review and Confirm: Terraform will display the planned changes. Confirm and apply the changes when prompted.
6. **Note:** Make Sure you destroy everything after completion of project
## Contributions

Contributions are welcome! Feel free to open issues, submit pull requests, or provide feedback to enhance TerraWeb.

