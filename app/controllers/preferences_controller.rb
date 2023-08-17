class PreferencesController < ApplicationController
  before_action :set_preference

  def update
    if @preference.update(preference_params)
      flash[:success] = 'Preferences updated successfully.'

      redirect_to preferences_path
    else
      render :edit
    end
  end

  private

  def preference_params
    params.require(:preference).permit(:vegetarian, :vegan, :gluten_free)
  end

  def set_preference
    @preference = current_user.preference || current_user.build_preference
  end
end
