# frozen_string_literal: true

# This is a top level comment
class FoodsController < ApplicationController
  before_action :set_food, only: %i[show update destroy]

  # GET /foods
  def index
    @foods = Food.all

    render json: @foods
  end

  # GET /foods/1
  def show
    render json: @food
  end

  # POST /foods
  def create
    @food = Food.new(food_params)

    if @food.save
      render json: @food, status: :created, location: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foods/1
  def update
    if @food.update(food_params)
      render json: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # DELETE /foods/1
  def destroy
    @food.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.expect(food: %i[name notes])
  end
end
