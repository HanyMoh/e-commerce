# If there is a revision file, it means that the app was automatically deployed
# hence activate sentry
sentry_enabled = Rails.env.production? || File.exist?(File.expand_path('../../REVISION', __dir__))

if sentry_enabled
  Raven.configure do |config|
    config.dsn = 'https://605c8480b8374e0fac7f5ebd14072191:1e5506291004434f9f877e3b97bbf7ad@sentry.io/1312978'
    config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
    config.release = APP_VERSION
  end
end
