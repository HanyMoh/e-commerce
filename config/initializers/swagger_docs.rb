Swagger::Docs::Config.register_apis(
  '1.0' => {
    api_extension_type: :json,
    api_file_path: 'public/ipa-swagger/',
    clean_directory: true,
    base_path: '/'
  }
)
