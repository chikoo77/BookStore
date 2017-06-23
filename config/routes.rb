# == Route Map
#
#                                Prefix Verb     URI Pattern                                  Controller#Action
#                      new_user_session GET      /users/sign_in(.:format)                     devise/sessions#new
#                          user_session POST     /users/sign_in(.:format)                     devise/sessions#create
#                  destroy_user_session DELETE   /users/sign_out(.:format)                    devise/sessions#destroy
# user_google_oauth2_omniauth_authorize GET|POST /users/auth/google_oauth2(.:format)          users/omniauth_callbacks#passthru
#  user_google_oauth2_omniauth_callback GET|POST /users/auth/google_oauth2/callback(.:format) users/omniauth_callbacks#google_oauth2
#                     new_user_password GET      /users/password/new(.:format)                devise/passwords#new
#                    edit_user_password GET      /users/password/edit(.:format)               devise/passwords#edit
#                         user_password PATCH    /users/password(.:format)                    devise/passwords#update
#                                       PUT      /users/password(.:format)                    devise/passwords#update
#                                       POST     /users/password(.:format)                    devise/passwords#create
#              cancel_user_registration GET      /users/cancel(.:format)                      devise/registrations#cancel
#                 new_user_registration GET      /users/sign_up(.:format)                     devise/registrations#new
#                edit_user_registration GET      /users/edit(.:format)                        devise/registrations#edit
#                     user_registration PATCH    /users(.:format)                             devise/registrations#update
#                                       PUT      /users(.:format)                             devise/registrations#update
#                                       DELETE   /users(.:format)                             devise/registrations#destroy
#                                       POST     /users(.:format)                             devise/registrations#create
#                          book_reviews GET      /books/:book_id/reviews(.:format)            reviews#index
#                                       POST     /books/:book_id/reviews(.:format)            reviews#create
#                       new_book_review GET      /books/:book_id/reviews/new(.:format)        reviews#new
#                      edit_book_review GET      /books/:book_id/reviews/:id/edit(.:format)   reviews#edit
#                           book_review GET      /books/:book_id/reviews/:id(.:format)        reviews#show
#                                       PATCH    /books/:book_id/reviews/:id(.:format)        reviews#update
#                                       PUT      /books/:book_id/reviews/:id(.:format)        reviews#update
#                                       DELETE   /books/:book_id/reviews/:id(.:format)        reviews#destroy
#                                 books GET      /books(.:format)                             books#index
#                                       POST     /books(.:format)                             books#create
#                              new_book GET      /books/new(.:format)                         books#new
#                             edit_book GET      /books/:id/edit(.:format)                    books#edit
#                                  book GET      /books/:id(.:format)                         books#show
#                                       PATCH    /books/:id(.:format)                         books#update
#                                       PUT      /books/:id(.:format)                         books#update
#                                       DELETE   /books/:id(.:format)                         books#destroy
#                                  root GET      /                                            books#index
# 

Rails.application.routes.draw do
  devise_for :users, :controllers => {
  	:omniauth_callbacks => "users/omniauth_callbacks"
  }
    resources :books do
      resources :reviews
    end
    root 'books#index'
end
