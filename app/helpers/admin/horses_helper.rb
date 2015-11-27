module Admin::HorsesHelper

  def category_column(horse, _column)
    I18n.t("activerecord.extra.horse_categories.#{horse.category}")
  end

end
