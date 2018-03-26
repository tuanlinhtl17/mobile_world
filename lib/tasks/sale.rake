desc "update_sale_expired"
task update_sale_expired: :environment do
  mobiles = Mobile.all
  mobiles.each do |mobile|
    if mobile.sale_time.nil? || mobile.sale_time < Time.now
      mobile.update_attributes price: mobile.older_price
    end
  end
end
