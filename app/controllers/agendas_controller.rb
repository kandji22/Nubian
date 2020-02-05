# frozen_string_literal: true

class AgendasController < ApplicationController
  before_action :set_agenda, only: %i[show edit update destroy]
  before_action :ensure_authenticated, only: %i[edit new create update destroy]
  before_action :ensure_admin?, only: %i[edit new create update destroy]

  def new
    @agenda = Agenda.new
   end

  def create
    @agenda = Agenda.new(agenda_params)
    respond_to do |format|
      if @agenda.save
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @agenda, notice: 'agenda was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @agenda.update(agenda_params)
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @agenda, notice: 'agenda was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @agenda.destroy!
    respond_to do |format|
      format.js
    end
end

  def index
    @agendas = Agenda.most_recent
  end

  private

  def set_agenda
    @agenda = Agenda.find(params[:id])
  end

  def agenda_params
    params.require(:agenda).permit(:name, :lieu, :date)
  end
end
