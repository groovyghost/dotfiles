local opts = {
  schemaStore = {
    enable = true,
    url = "https://www.schemastore.org/api/json/catalog.json",
  },
  schemas = {
    kubernetes = "*.yaml",
    ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
    ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
    ["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible-tasks.json"] = "roles/tasks/*.{yml,yaml}",
    ["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible-playbook.json"] = "*play*.{yml,yaml}",
    ["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible-vars.json"] = "*vars*.{yml,yaml}",
    ["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible-requirements.json"] = "*requirements*.{yml,yaml}",
    ["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible.json"] = "roles/*.{yml,yaml}",
    ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
    ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
    ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
    ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
  },
  format = { enabled = true },
  validate = false, -- TODO: conflicts between Kubernetes resources and kustomization.yaml
  completion = true,
  hover = true,
}

return opts