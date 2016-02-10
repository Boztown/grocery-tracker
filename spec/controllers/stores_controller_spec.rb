require 'rails_helper'
require 'support/controller_macros'
require 'support/devise'

RSpec.describe StoresController, type: :controller do
  
  login_user

  # This should return the minimal set of attributes required to create a valid
  # Store. As you add validations to Store, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.create(:store)
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StoresController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all stores as @stores" do
      store = FactoryGirl.create(:store)
      get :index
      expect(assigns(:stores)).to eq([store])
    end
  end

  describe "GET #show" do
    it "assigns the requested store as @store" do
      store = Store.create! valid_attributes
      get :show, {:id => store.to_param}, valid_session
      expect(assigns(:store)).to eq(store)
    end
  end

  describe "GET #new" do
    it "assigns a new store as @store" do
      store = FactoryGirl.create(:store)
      get :new
      expect(assigns(:store)).to be_a_new(Store)
    end
  end

  describe "GET #edit" do
    it "assigns the requested store as @store" do
      store = Store.create! valid_attributes
      get :edit, {:id => store.to_param}, valid_session
      expect(assigns(:store)).to eq(store)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Store" do
        expect {
          post :create, {:store => valid_attributes}, valid_session
        }.to change(Store, :count).by(1)
      end

      it "assigns a newly created store as @store" do
        post :create, {:store => valid_attributes}, valid_session
        expect(assigns(:store)).to be_a(Store)
        expect(assigns(:store)).to be_persisted
      end

      it "redirects to the created store" do
        post :create, {:store => valid_attributes}, valid_session
        expect(response).to redirect_to(Store.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved store as @store" do
        post :create, {:store => invalid_attributes}, valid_session
        expect(assigns(:store)).to be_a_new(Store)
      end

      it "re-renders the 'new' template" do
        post :create, {:store => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested store" do
        store = Store.create! valid_attributes
        put :update, {:id => store.to_param, :store => new_attributes}, valid_session
        store.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested store as @store" do
        store = Store.create! valid_attributes
        put :update, {:id => store.to_param, :store => valid_attributes}, valid_session
        expect(assigns(:store)).to eq(store)
      end

      it "redirects to the store" do
        store = Store.create! valid_attributes
        put :update, {:id => store.to_param, :store => valid_attributes}, valid_session
        expect(response).to redirect_to(store)
      end
    end

    context "with invalid params" do
      it "assigns the store as @store" do
        store = Store.create! valid_attributes
        put :update, {:id => store.to_param, :store => invalid_attributes}, valid_session
        expect(assigns(:store)).to eq(store)
      end

      it "re-renders the 'edit' template" do
        store = Store.create! valid_attributes
        put :update, {:id => store.to_param, :store => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested store" do
      store = Store.create! valid_attributes
      expect {
        delete :destroy, {:id => store.to_param}, valid_session
      }.to change(Store, :count).by(-1)
    end

    it "redirects to the stores list" do
      store = Store.create! valid_attributes
      delete :destroy, {:id => store.to_param}, valid_session
      expect(response).to redirect_to(stores_url)
    end
  end

end
