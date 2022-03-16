def reset_temp_purchase_additional_infos_with_category!
    return unless @params[:items].present?

    @params[:items].each do |item|
      additional_info = UpgModel::Honbus::Inventory::TempPurchaseAdditionalInfo.find(
        仮入庫id: item[:temp_purchase_id],
        店舗id:  @honbus_shop_id
      )
      reset_not_navi_infos(item[:category_ids]&.first(2))

      reset_not_infos(item[:category_ids]&.first(3))

      # ナビ系

      additional_info&.save
    end
  end

  def reset_not_infos(category_ids)
    case category_ids
    when %w[01 10 01], %w[01 10 03] # タイヤ系
      reset_not_tire_infos(additional_info)
    when %w[01 20 01], %w[01 20 02] # ホイール系
      reset_not_wheel_infos(additional_info)
    when %w[01 25 01], %w[01 20 03] # タイヤホイールセット系
      reset_not_tire_wheel_set_infos(additional_info)
    when %w[20 92 20]               # ウェア系
      reset_not_wear_infos(additional_info)
    when %w[01 80 01], %w[20 94 05] # 車体情報系
      reset_not_vehicles_motorcycles_infos(additional_info)
    end
  end

  def reset_not_navi_infos()
    if item[:category_ids]&.first(2) == %w[01 40]
        reset_not_navi_infos(additional_info)
    end
  end
