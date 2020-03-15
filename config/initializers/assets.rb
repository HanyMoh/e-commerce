# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('vendor/assets/node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w[dashboard.css dashboard.js api.css carts.js api.js buildings.js map_manipulation.js buildings_location.js buildingMap_actions.js brands_id.js buildingMap_actions.js building_level.css buildings.css themify.ttf cart/style.css vendor/nice-select.css vendor/pretty-checkbox.min.css vendor/swiper.min.css vendor/jquery.bootstrap-touchspin.min.css vendor/multiple-select.css vendor/animate.css cart/fontello.css cart/animation.css]
Rails.application.config.assets.precompile += %w[navbox.css navbox.js old_dashboard.css map_view.css old_dashboard.js navboxcus.css navboxcus.js navboxeditor.css navboxeditor.js vendor/jquery.bootstrap-touchspin.min.js vendor/jquery.nice-select.min.js vendor/multiple-select.js vendor/swiper.min.js vendor/wow.min.js carts/main.js]
