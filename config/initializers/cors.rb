Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000', 'http://example.com' # Replace with your allowed origins

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head],
             credentials: true # Set to false if you want to allow wildcard origins
  end
end