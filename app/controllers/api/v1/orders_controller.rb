module Api::V1
  class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]

    # GET /orders
    def index
      @orders = Order.all

      render json: @orders
    end

    # GET /orders/1
    def show
      render json: @order
    end

    # POST /orders
    def create
      @order = Order.new(order_params)
      param_user_cpf = params['order'][:user_attributes][:cpf]
      user_cpf = User.find_by_cpf(param_user_cpf)
      if user_cpf
        @order.user = user_cpf
      else
        @order.build_user
        @order.user.cpf = param_user_cpf
        @order.user.email = params['order'][:user_attributes][:email]
        @order.user.name = params['order'][:user_attributes][:name]
      end

      if @order.save
        render json: @order, status: :created, location: api_v1_order_url(@order)
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /orders/1
    def update
      if @order.update(order_params)
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    # DELETE /orders/1
    def destroy
      @order.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def order_params
        params.require(:order).permit(:cel_model, :imei, :parcel_number, :price, :status, :user_id, user_attributes: [:name, :cpf, :email])
      end
  end
end
