module RecipesHelper
  def highlight_syntax(code)
    raw CodeRay.scan(code, :ruby).div
  end

  def all_recipe_versions
    versions = @recipe.versions.collect{|v| ["Version #{v.index + 1}", v.index.to_s]}.reverse
    versions[0] = ["Latest version", ""]
    versions
  end

  def not_latest_version
    !params[:version].blank? && params[:version].to_i < @recipe.versions.length
  end
end
