class Dashboard::ImportSubProductGalleryService
  def initialize
    @file_name = SecureRandom.urlsafe_base64(64)
    @folder = "public/uploads/#{@file_name}"
    @zip_file = "public/uploads/#{@file_name}.zip"
    @extracted_files = []
    @pics = []
    @results = { status: nil, message: nil }
  end

  def import(params, sub_product)
    # Decoding the Base64 file to a an actualy file
    File.open(@zip_file, 'wb') { |f| f.write(Base64.decode64(params[:file])) }

    # Extracting the zip file content to the folder we specified
    Zip::File.open(@zip_file) do |zip_file|
      zip_file.each do |f|
        f_path = File.join(@folder, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
        @extracted_files << f_path
      end
    end

    # Filtering files (Ignoring folders), and adding them to array
    @filtered_files = @extracted_files.select { |f| f.include?('.') }

    @filtered_files.each do |f|
      @pics << File.open(f)
    end

    # Uploading pics and attaching them to the sub product gallery
    if sub_product
      sub_product.gallery = @pics
      sub_product.gallery_index = 0
      sub_product.save
      @results[:status] = 'success'
      @results[:message] = "images uploaded successfully to product which has barcode '#{sub_product.barcode}' in brand '#{sub_product.brand.name}'"
    else
      @results[:status] = 'failure'
      @results[:message] = "no barcode matches '#{sub_products.first.barcode}' in brand '#{sub_products.first.brand.name}'"
    end

    # Cleaning the uploading ZIP file and the extracted files and folders
    FileUtils.rm_rf(@zip_file)
    FileUtils.rm_rf(@folder)

    @results
  end
end
