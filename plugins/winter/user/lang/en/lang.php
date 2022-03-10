<?php

/*
 * (c) Boosteur.com - 2022
 */

return [
  'plugin' => [
    'name'             => 'User',
    'description'      => 'Front-end user management.',
    'tab'              => 'Users',
    'access_users'     => 'Manage Users',
    'access_groups'    => 'Manage User Groups',
    'access_settings'  => 'Manage User Settings',
    'impersonate_user' => 'Impersonate Users',
  ],
  'users' => [
    'menu_label'                  => 'Users',
    'all_users'                   => 'All Users',
    'new_user'                    => 'New User',
    'list_title'                  => 'Manage Users',
    'trashed_hint_title'          => 'User has deactivated their account',
    'trashed_hint_desc'           => 'This user has deactivated their account and no longer wants to appear on the site. They can restore their account at any time by signing back in.',
    'banned_hint_title'           => 'User has been banned',
    'banned_hint_desc'            => 'This user has been banned by an administrator and will be unable to sign in.',
    'guest_hint_title'            => 'This is a guest user',
    'guest_hint_desc'             => 'This user is stored for reference purposes only and needs to register before signing in.',
    'activate_warning_title'      => 'User not activated!',
    'activate_warning_desc'       => 'This user has not been activated and may be unable to sign in.',
    'activate_confirm'            => 'Do you really want to activate this user?',
    'activated_success'           => 'User has been activated',
    'activate_manually'           => 'Activate this user manually',
    'convert_guest_confirm'       => 'Convert this guest to a user?',
    'convert_guest_manually'      => 'Convert to registered user',
    'convert_guest_success'       => 'User has been converted to a registered account',
    'impersonate_user'            => 'Impersonate user',
    'impersonate_confirm'         => 'Impersonate this user? You can revert to your original state by logging out.',
    'impersonate_success'         => 'You are now impersonating this user',
    'delete_confirm'              => 'Do you really want to delete this user?',
    'unban_user'                  => 'Unban this user',
    'unban_confirm'               => 'Do you really want to unban this user?',
    'unbanned_success'            => 'User has been unbanned',
    'return_to_list'              => 'Return to users list',
    'update_details'              => 'Update details',
    'bulk_actions'                => 'Bulk actions',
    'delete_selected'             => 'Delete selected',
    'delete_selected_confirm'     => 'Delete the selected users?',
    'delete_selected_empty'       => 'There are no selected users to delete.',
    'delete_selected_success'     => 'Successfully deleted the selected users.',
    'activate_selected'           => 'Activate selected',
    'activate_selected_confirm'   => 'Activate the selected users?',
    'activate_selected_empty'     => 'There are no selected users to activate.',
    'activate_selected_success'   => 'Successfully activated the selected users.',
    'deactivate_selected'         => 'Deactivate selected',
    'deactivate_selected_confirm' => 'Deactivate the selected users?',
    'deactivate_selected_empty'   => 'There are no selected users to deactivate.',
    'deactivate_selected_success' => 'Successfully deactivated the selected users.',
    'restore_selected'            => 'Restore selected',
    'restore_selected_confirm'    => 'Restore the selected users?',
    'restore_selected_empty'      => 'There are no selected users to restore.',
    'restore_selected_success'    => 'Successfully restored the selected users.',
    'ban_selected'                => 'Ban selected',
    'ban_selected_confirm'        => 'Ban the selected users?',
    'ban_selected_empty'          => 'There are no selected users to ban.',
    'ban_selected_success'        => 'Successfully banned the selected users.',
    'unban_selected'              => 'Unban selected',
    'unban_selected_confirm'      => 'Unban the selected users?',
    'unban_selected_empty'        => 'There are no selected users to unban.',
    'unban_selected_success'      => 'Successfully unbanned the selected users.',
    'unsuspend'                   => 'Unsuspend',
    'unsuspend_success'           => 'User has been unsuspended.',
    'unsuspend_confirm'           => 'Unsuspend this user?',
  ],
  'settings' => [
    'users'                         => 'Users',
    'menu_label'                    => 'User settings',
    'menu_description'              => 'Manage user based settings.',
    'activation_tab'                => 'Activation',
    'signin_tab'                    => 'Sign in',
    'registration_tab'              => 'Registration',
    'profile_tab'                   => 'Profile',
    'notifications_tab'             => 'Notifications',
    'allow_registration'            => 'Allow user registration',
    'allow_registration_comment'    => 'If this is disabled users can only be created by administrators.',
    'activate_mode'                 => 'Activation mode',
    'activate_mode_comment'         => 'Select how a user account should be activated.',
    'activate_mode_auto'            => 'Automatic',
    'activate_mode_auto_comment'    => 'Activated automatically upon registration.',
    'activate_mode_user'            => 'User',
    'activate_mode_user_comment'    => 'The user activates their own account using mail.',
    'activate_mode_admin'           => 'Administrator',
    'activate_mode_admin_comment'   => 'Only an Administrator can activate a user.',
    'require_activation'            => 'Sign in requires activation',
    'require_activation_comment'    => 'Users must have an activated account to sign in.',
    'use_throttle'                  => 'Throttle attempts',
    'use_throttle_comment'          => 'Repeat failed sign in attempts will temporarily suspend the user.',
    'use_register_throttle'         => 'Throttle registration',
    'use_register_throttle_comment' => 'Prevent multiple registrations from the same IP in short succession.',
    'block_persistence'             => 'Prevent concurrent sessions',
    'block_persistence_comment'     => 'When enabled users cannot sign in to multiple devices at the same time.',
    'login_attribute'               => 'Login attribute',
    'login_attribute_comment'       => 'Select what primary user detail should be used for signing in.',
    'remember_login'                => 'Remember login mode',
    'remember_login_comment'        => 'Select if the user session should be persistent.',
    'remember_always'               => 'Always',
    'remember_never'                => 'Never',
    'remember_ask'                  => 'Ask the user on login',
  ],
  'user' => [
    'label'                    => 'User',
    'id'                       => 'ID',
    'username'                 => 'Username',
    'name'                     => 'Name',
    'name_empty'               => 'Anonymous',
    'surname'                  => 'Surname',
    'email'                    => 'Email',
    'created_at'               => 'Registered',
    'last_seen'                => 'Last seen',
    'is_guest'                 => 'Guest',
    'joined'                   => 'Joined',
    'is_online'                => 'Online now',
    'is_offline'               => 'Currently offline',
    'send_invite'              => 'Send invitation by email',
    'send_invite_comment'      => 'Sends a welcome message containing login and password information.',
    'create_password'          => 'Create Password',
    'create_password_comment'  => 'Enter a new password used for signing in.',
    'reset_password'           => 'Reset Password',
    'reset_password_comment'   => 'To reset this users password, enter a new password here.',
    'confirm_password'         => 'Password Confirmation',
    'confirm_password_comment' => 'Enter the password again to confirm it.',
    'groups'                   => 'Groups',
    'empty_groups'             => 'There are no user groups available.',
    'avatar'                   => 'Avatar',
    'details'                  => 'Details',
    'account'                  => 'Account',
    'block_mail'               => 'Block all outgoing mail sent to this user.',
    'status_guest'             => 'Guest',
    'status_activated'         => 'Activated',
    'status_registered'        => 'Registered',
    'created_ip_address'       => 'Created IP Address',
    'last_ip_address'          => 'Last IP Address',
  ],
  'group' => [
    'label'             => 'Group',
    'id'                => 'ID',
    'name'              => 'Name',
    'description_field' => 'Description',
    'code'              => 'Code',
    'code_comment'      => 'Enter a unique code used to identify this group.',
    'created_at'        => 'Created',
    'users_count'       => 'Users',
  ],
  'groups' => [
    'menu_label'              => 'Groups',
    'all_groups'              => 'User Groups',
    'new_group'               => 'New Group',
    'delete_selected_confirm' => 'Do you really want to delete selected groups?',
    'list_title'              => 'Manage Groups',
    'delete_confirm'          => 'Do you really want to delete this group?',
    'delete_selected_success' => 'Successfully deleted the selected groups.',
    'delete_selected_empty'   => 'There are no selected groups to delete.',
    'return_to_list'          => 'Back to groups list',
    'return_to_users'         => 'Back to users list',
    'create_title'            => 'Create User Group',
    'update_title'            => 'Edit User Group',
    'preview_title'           => 'Preview User Group',
  ],
  'login' => [
    'attribute_email'    => 'Email',
    'attribute_username' => 'Username',
  ],
  'account' => [
    'account'                          => 'Account',
    'account_desc'                     => 'User management form.',
    'banned'                           => 'Sorry, this user is currently not activated. Please contact us for further assistance.',
    'redirect_to'                      => 'Redirect to',
    'redirect_to_desc'                 => 'Page name to redirect to after update, sign in or registration.',
    'code_param'                       => 'Activation Code Param',
    'code_param_desc'                  => 'The page URL parameter used for the registration activation code',
    'force_secure'                     => 'Force secure protocol',
    'force_secure_desc'                => 'Always redirect the URL with the HTTPS schema.',
    'invalid_user'                     => 'A user was not found with the given credentials.',
    'invalid_activation_code'          => 'Invalid activation code supplied.',
    'invalid_deactivation_pass'        => 'The password you entered was invalid.',
    'invalid_current_pass'             => 'The current password you entered was invalid.',
    'success_activation'               => 'Successfully activated your account.',
    'success_deactivation'             => 'Successfully deactivated your account. Sorry to see you go!',
    'success_saved'                    => 'Settings successfully saved!',
    'login_first'                      => 'You must be logged in first!',
    'already_active'                   => 'Your account is already activated!',
    'activation_email_sent'            => 'An activation email has been sent to your email address.',
    'activation_by_admin'              => 'You have successfully registered. Your account is not yet active and must be approved by an administrator.',
    'registration_disabled'            => 'Registrations are currently disabled.',
    'registration_throttled'           => 'Registration is throttled. Please try again later.',
    'sign_in'                          => 'Sign in',
    'register'                         => 'Register',
    'full_name'                        => 'Full Name',
    'email'                            => 'Email',
    'password'                         => 'Password',
    'login'                            => 'Login',
    'new_password'                     => 'New Password',
    'new_password_confirm'             => 'Confirm New Password',
    'update_requires_password'         => 'Confirm password on update',
    'update_requires_password_comment' => 'Require the current password of the user when changing their profile.',
  ],
  'reset_password' => [
    'reset_password'      => 'Reset Password',
    'reset_password_desc' => 'Forgotten password form.',
    'code_param'          => 'Reset Code Param',
    'code_param_desc'     => 'The page URL parameter used for the reset code',
  ],
  'session' => [
    'session'                    => 'Session',
    'session_desc'               => 'Adds the user session to a page and can restrict page access.',
    'security_title'             => 'Allow only',
    'security_desc'              => 'Who is allowed to access this page.',
    'all'                        => 'All',
    'users'                      => 'Users',
    'guests'                     => 'Guests',
    'allowed_groups_title'       => 'Allow groups',
    'allowed_groups_description' => 'Choose allowed groups or none to allow all groups',
    'redirect_title'             => 'Redirect to',
    'redirect_desc'              => 'Page name to redirect if access is denied.',
    'logout'                     => 'You have been successfully logged out!',
    'stop_impersonate_success'   => 'You are no longer impersonating a user.',
  ],
];
