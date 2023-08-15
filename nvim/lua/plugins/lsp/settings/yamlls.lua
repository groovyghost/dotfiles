return {
  schemaStore = {
    enable = true,
    url = "https://www.schemastore.org/api/json/catalog.json",
  },
  schemas = {
    kubernetes = "*.yaml",
    ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
    ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
    ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
    ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
  },
  format = { enabled = false },
  -- anabling this conflicts between Kubernetes resources and kustomization.yaml and Helmreleases
  -- see utils.custom_lsp_attach() for the workaround
  -- how can I detect Kubernetes ONLY yaml files? (no CRDs, Helmreleases, etc.)
  validate = false,
  completion = true,
  hover = true,
}
