require('bundler/setup')
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
#add also reload

get ("/") do
  @brands = Brand.all()
  @stores = Store.all()
  erb(:index)
end

  post ("/brands") do
    name = params.fetch('name').capitalize()
    if name.length>0
      Brand.create(:name => name)
      redirect('/')
    else
      redirect('/')
    end
  end

  post('/stores') do
    name = params.fetch('name').capitalize()
    address = params.fetch('address').capitalize()
    phone = params.fetch('phone').capitalize()
    if name.length>0
      store = Store.create(:name => name, :address => address, :phone => phone)
      redirect("/")
    else
      redirect("/")
    end
  end

get ("/brands/:id") do
  @brand = Brand.find(params.fetch('id'))
  @store = Store.all()
  erb(:brand)
end

  post('/stores2') do
    store_id = params.fetch('store_id').to_i
    store = Store.find(store_id)
    self_id = params.fetch('self_id')
    brand = Brand.find(params.fetch('self_id'))
    store.brands << brand
    redirect("/brands/#{self_id}")
  end

get ('/stores/:id') do
  @store = Store.find(params.fetch('id'))
  @brands = Brand.all
  erb(:store)
end

  delete ('/stores') do
    id = params.fetch('id')
    store = Store.find(id)
    store.delete()
    redirect('/')
  end

  post('/brand2') do
    brand_id = params.fetch('brand_id').to_i
    brand = Brand.find(brand_id)
    self_id = params.fetch('self_id')
    store = Store.find(params.fetch('self_id'))
    brand.stores << store
    redirect("/stores/#{store.id}")
  end

get('/stores/:id/update') do
  @store = Store.find(params.fetch('id'))
  erb(:update)
end

  patch ('/stores') do
    self_id = params.fetch('self_id')
    store=Store.find(params.fetch('self_id').to_i)
    name=params.fetch('name').capitalize()
    address=params.fetch('address').capitalize()
    phone=params.fetch('phone').capitalize()
    if name.length>0
      store.update({:name => name, :address => address, :phone => phone})
      redirect("/")
    else
      redirect("/")
    end
  end
