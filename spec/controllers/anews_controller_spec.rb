require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AnewsController do

  # This should return the minimal set of attributes required to create a valid
  # Anew. As you add validations to Anew, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "sword" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AnewsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all anews as @anews" do
      anew = Anew.create! valid_attributes
      get :index, {}, valid_session
      assigns(:anews).should eq([anew])
    end
  end

  describe "GET show" do
    it "assigns the requested anew as @anew" do
      anew = Anew.create! valid_attributes
      get :show, {:id => anew.to_param}, valid_session
      assigns(:anew).should eq(anew)
    end
  end

  describe "GET new" do
    it "assigns a new anew as @anew" do
      get :new, {}, valid_session
      assigns(:anew).should be_a_new(Anew)
    end
  end

  describe "GET edit" do
    it "assigns the requested anew as @anew" do
      anew = Anew.create! valid_attributes
      get :edit, {:id => anew.to_param}, valid_session
      assigns(:anew).should eq(anew)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Anew" do
        expect {
          post :create, {:anew => valid_attributes}, valid_session
        }.to change(Anew, :count).by(1)
      end

      it "assigns a newly created anew as @anew" do
        post :create, {:anew => valid_attributes}, valid_session
        assigns(:anew).should be_a(Anew)
        assigns(:anew).should be_persisted
      end

      it "redirects to the created anew" do
        post :create, {:anew => valid_attributes}, valid_session
        response.should redirect_to(Anew.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved anew as @anew" do
        # Trigger the behavior that occurs when invalid params are submitted
        Anew.any_instance.stub(:save).and_return(false)
        post :create, {:anew => { "sword" => "invalid value" }}, valid_session
        assigns(:anew).should be_a_new(Anew)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Anew.any_instance.stub(:save).and_return(false)
        post :create, {:anew => { "sword" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested anew" do
        anew = Anew.create! valid_attributes
        # Assuming there are no other anews in the database, this
        # specifies that the Anew created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Anew.any_instance.should_receive(:update_attributes).with({ "sword" => "MyString" })
        put :update, {:id => anew.to_param, :anew => { "sword" => "MyString" }}, valid_session
      end

      it "assigns the requested anew as @anew" do
        anew = Anew.create! valid_attributes
        put :update, {:id => anew.to_param, :anew => valid_attributes}, valid_session
        assigns(:anew).should eq(anew)
      end

      it "redirects to the anew" do
        anew = Anew.create! valid_attributes
        put :update, {:id => anew.to_param, :anew => valid_attributes}, valid_session
        response.should redirect_to(anew)
      end
    end

    describe "with invalid params" do
      it "assigns the anew as @anew" do
        anew = Anew.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Anew.any_instance.stub(:save).and_return(false)
        put :update, {:id => anew.to_param, :anew => { "sword" => "invalid value" }}, valid_session
        assigns(:anew).should eq(anew)
      end

      it "re-renders the 'edit' template" do
        anew = Anew.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Anew.any_instance.stub(:save).and_return(false)
        put :update, {:id => anew.to_param, :anew => { "sword" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested anew" do
      anew = Anew.create! valid_attributes
      expect {
        delete :destroy, {:id => anew.to_param}, valid_session
      }.to change(Anew, :count).by(-1)
    end

    it "redirects to the anews list" do
      anew = Anew.create! valid_attributes
      delete :destroy, {:id => anew.to_param}, valid_session
      response.should redirect_to(anews_url)
    end
  end

end
