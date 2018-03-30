namespace :db do
  desc "remake database data"
  task remake_data: :environment do
    %w[db:drop db:create db:migrate].each do |task|
      Rake::Task[task].invoke
    end

    puts "You will be prompted to create data for project."

    Settings.users.each do |user|
      user = User.new email: user.email, password: user.password, role: user.role,
                      address: user.address, phone_number: user.phone_number,
                      password_confirmation: user.password_confirmation

      user.skip_confirmation!
      user.save!
    end

    Settings.makers.each do |maker|
      Maker.create name: maker.name
    end

    Settings.mobiles.each do |mobile|
      Mobile.create name: mobile.name, ram: mobile.ram, price: mobile.price,
                    width: mobile.width, height: mobile.height,
                    front_camera: mobile.front_camera, behind_camera: mobile.behind_camera,
                    weight: mobile.weight, battery: mobile.battery,
                    resolution_width: mobile.resolution_width,
                    resolution_height: mobile.resolution_height,
                    maker_id: mobile.maker_id, avatar: open(mobile.avatar),
                    description: mobile.description,
                    older_price: mobile.older_price, sale_time: mobile.sale_time,
                    hot_mobile: open(mobile.hot_mobile)
    end

    Settings.colors.each do |color|
      Color.create color: color.name
    end

    Settings.mobile_colors.each do |mobile_color|
      MobileColor.create mobile_id: mobile_color.mobile_id,
                          color_id: mobile_color.color_id
    end

    Settings.advertisements.each do |ads|
      Advertisement.create title: ads.title, maker_id: ads.maker_id,
                           image: open(ads.image)
    end

    Settings.images.each do |image|
      Image.create mobile_image: open(image.mobile_image),
                   mobile_id: image.mobile_id
    end

    Settings.citys.each do |city|
      City.create name: city.name
    end

    Settings.districts.each do |district|
      District.create name: district.name, city_id: district.city_id
    end

    Settings.shops.each do |shop|
      Shop.create address: shop.address, city_id: shop.city_id,
                  district_id: shop.district_id
    end

    Settings.shop_mobiles.each do |shop_mobile|
      ShopMobile.create amount: shop_mobile.amount,
                        mobile_id: shop_mobile.mobile_id,
                        shop_id: shop_mobile.shop_id
    end
  end
end
