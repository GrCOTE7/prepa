<?php return [
    'plugin' => [
        'name' => 'Octolanding',
        'description' => 'Simple slider'
    ],

    'form' => [
        'field' => [
            'name' => 'Name',
            'phone' => 'Phone',
            'created_at' => 'Date of receiving',
        ],
        'messages' => [
            'repeat' => 'The form can be re-fill through',
            'second' => 'seconds',
            'sended' => 'Data successfully sent!',
        ],
    ],

    'mail' => [
        'title' => 'New application!',
        'application_header' => 'You have a new application on your site!',
        'application_text' => 'You can read the application details below.',
        'application_info' => 'Application',

    ],

    'slider' => [
        'button' => 'More detailed',
        'component' => [
            'name' => 'Slider',
            'description' => 'Adds a slider to the site',
            'properties' => [
                'name' => 'Choose a slider',
                'description' => 'Any of the previously created',
                'twigname' => 'Enter a name for the busting  in the twig',
                'include' => [
                    'jquery' => 'To plug jQuery v3.3.1',
                    'carousel' => 'To plug owl.carousel v2.2.3',
                ],
            ],
        ],

        'model' => [
            'menu-name' => 'Slider',
            'isvideo' => [
                'name' => 'Video?',
                'comment' => 'Enable if you want video',
            ],
            'video' => [
                'name' => 'Download video',
                'comment' => 'Select video',
            ],
            'slider' => [
                'name_multiple' => 'Sliders',
                'return_slide' => 'Back to slides',
                'name' => [
                    'name' => 'Title',
                    'comment' => 'Enter slider name',
                ],
            ],
            'slide' => [
                'name' => [
                    'name' => 'Title',
                    'comment' => 'Enter slide name (only for myself)',
                ],
                'slider' => [
                    'name' => 'Slider',
                    'comment' => 'Select the slider to which this slide should belong.',
                ],
                'image' => [
                    'name' => 'image',
                    'comment' => 'Upload the image which will be attached to this slide.',
                ],
                'position' => [
                    'name' => 'Position'
                ],
                'desc' => [
                    'name' => 'Slide text',
                    'comment' => 'Depending on the selected item, this text will be displayed either on the slider or below it.',
                ],
                'sections1' => [
                    'name' => 'Extra options',
                    'comment' => 'used NOT by all blocks',
                ],
                'link' => [
                    'name' => 'Link',
                    'comment' => 'Add a link if you have it',
                ],
                'sort_order' => [
                    'name' => 'Sorting',
                    'comment' => 'Sets the slide show order (set automatically)',
                ],
                'desc_more' => [
                    'name' => 'Additional field',
                ],
            ],
        ],
    ],

    'block1' => [
        'name' => 'Block 1',
        'model' => [
            'add_item' => 'Add item',
            'active' => [
                'name' => 'Activity',
                'comment' => 'You can make an item inactive without deleting it!',
            ],
            'name' => [
                'name' => 'Title',
                'comment' => 'The title of the block, it is displayed on the site!',
            ],
            'descr' => [
                'name' => 'Subtitle (optional)',
                'comment' => 'Optional field if it is not needed it will not be displayed',
            ],
            'tab' => [
                'name' => 'Content',
            ],
            'block' => [
                'name' => 'Blocks',
                'fields' => [
                    'name' => [
                        'name' => 'Title',
                        'comment' => 'Block title',
                    ],
                    'image' => [
                        'name' => 'Icon',
                        'comment' => 'Block icon',
                    ],
                    'text' => [
                        'name' => 'Content block',
                        'comment' => 'Recommended to use lists ul > li',
                    ],
                ],
            ]
        ],
    ],

    'block2' => [
        'name' => 'Block 2',
        'model' => [
            'name' => [
                'name' => 'Title',
                'comment' => 'The title of the block, it is displayed on the site!',
            ],
            'descr' => [
                'name' => 'Subtitle (optional)',
                'comment' => 'Optional field if it is not needed it will not be displayed',
            ],
            'tab' => [
                'name' => 'Content',
            ],
            'full_display' => [
                'name' => 'Full display block',
                'comment' => 'If you want to exclude the container from the block',
            ],
            'block' => [
                'name' => 'Blocks',
                'fields' => [
                    'name' => [
                        'name' => 'Title',
                        'comment' => 'Block title',
                    ],
                    'is_inverse' => [
                        'name' => 'Inversion',
                        'comment' => 'Display block horizontally',
                    ],
                    'text' => [
                        'name' => 'Content block',
                        'comment' => 'Fill the block with text',
                    ],
                    'slider_id' => [
                        'name' => 'Slider',
                        'comment' => 'Select a previously created slider',
                    ],
                    'link' => [
                        'name' => 'Anchor link',
                        'comment' => 'Add unique link example `seo`',
                    ],
                    'link_button' => [
                        'name' => 'Button link',
                        'comment' => 'Enter the link if you want the block to have a `more` button with your link',
                    ],
                    'color' => [
                        'name' => 'Color block on the phone',
                        'comment' => 'If color is chosen, it will be the same as on PC version',
                    ],
                ],
            ]
        ],
    ],

    'block3' => [
        'name' => 'Block 3',
        'model' => [
            'name' => [
                'name' => 'Title',
                'comment' => 'The title of the block, it is displayed on the site!',
            ],
            'slider_id' => [
                'name' => 'Slider',
                'comment' => 'Select a previously created slider',
            ],
            'descr' => [
                'name' => 'Subtitle (optional)',
                'comment' => 'Optional field if it is not needed it will not be displayed',
            ],
            'section1' => [
                'name' => 'Decor',
            ],
            'backgorund' => [
                'name' => 'Background',
                'comment' => 'Choose a block background'
            ],
            'color' => [
                'name' => 'Header color',
                'comment' => 'Choose a header color to well blend with the background.'
            ],

        ],
    ],

    'block4' => [
        'name' => 'Block 4',
        'model' => [
            'name' => [
                'name' => 'Title',
                'comment' => 'The title of the block, it is displayed on the site!',
            ],
            'slider_id' => [
                'name' => 'Slider',
                'comment' => 'Select a previously created slider',
            ],
            'descr' => [
                'name' => 'Subtitle (optional)',
                'comment' => 'Optional field if it is not needed it will not be displayed',
            ],
            'left_block_name' => [
                'name' => 'The left block name',
                'comment' => 'The name will appear above the slider.',
            ],
            'right_block_name' => [
                'name' => 'The right block name',
                'comment' => 'The name will appear above the icons',
            ],
            'icons' => [
                'name' => 'The right part',
                'fields' => [
                    'name' => [
                        'name' => 'Title',
                        'comment' => 'Will be displayed to the right of the icon and above the text.'
                    ],
                    'text' => [
                        'name' => 'Text',
                        'comment' => 'Will be displayed to the right of the icon and under the title'
                    ],
                    'image' => [
                        'name' => 'Icon',
                        'comment' => 'Will be displayed to the left of the text and title.'
                    ],

                ],
            ],

        ],
    ],

    'block5' => [
        'name' => 'Block 5',
        'model' => [
            'name' => [
                'name' => 'Title',
                'comment' => 'The title of the block, it is displayed on the site!',
            ],
            'descr' => [
                'name' => 'Subtitle (optional)',
                'comment' => 'Optional field if it is not needed it will not be displayed',
            ],
            'tab' => [
                'name' => 'Content',
            ],
            'block' => [
                'name' => 'Blocks',
                'add' => 'Add block',
                'fields' => [
                    'margin' => [
                        'name' => 'Padding',
                        'comment' => 'Add padding top and bottom',
                    ],
                    'text1' => [
                        'name' => 'Text 1',
                        'comment' => 'Fill in the text block or not',
                    ],
                    'text2' => [
                        'name' => 'Text 2',
                        'comment' => 'Fill in the text block or not',
                    ],
                    'link' => [
                        'name' => 'Anchor link',
                        'comment' => 'Add unique link example `seo`',
                    ],
                    'image' => [
                        'name' => 'Image',
                        'comment' => 'Upload an image or not',
                    ],

                ],
            ]
        ],
    ],

    'contacts' => [
        'name' => 'Contacts',
        'model' => [
            'name' => [
                'name' => 'Title',
                'comment' => 'The title of the block, it is displayed on the site!',
            ],
            'active_color' => [
                'name' => 'Own color of the left block',
                'comment' => 'Turn this option on to set the color manually.',
            ],
            'color' => [
                'name' => 'Choose color',
                'comment' => 'Choose one or another color.',
            ],
            'active_text' => [
                'name' => 'Text above block',
                'comment' => 'Enable this option if you want to add text before the block.',
            ],
            'text' => [
                'name' => 'Text',
                'comment' => 'Displays the text above the block',
            ],
            'content' => [
                'name' => 'Points',
                'fields' => [
                    'name' => [
                        'name' => 'Title',
                        'comment' => 'Enter a point title such as `Phone:`',
                    ],
                    'type' => [
                        'name' => 'Point type',
                        'comment' => 'Select the type of point, such as phone, mail or other, to form the correct link',
                    ],
                    'text' => [
                        'name' => 'Content',
                        'comment' => 'Enter content such as your phone, address, or company email.'
                    ],

                ],
            ],
        ],
    ],

    'feedback' => [
        'name' => 'Applications',
        'model' => [
            'active' => [
                'name' => 'Processed',
                'comment' => 'Check the box if this application has already been reviewed.',
            ],
            'created_at' => [
                'name' => 'Date of receiving',
                'comment' => 'Created automatically when application has received',
            ],
            'section1' => [
                'name' => 'User data',
            ],

            'name' => [
                'name' => 'Name',
            ],
            'phone' => [
                'name' => 'Phone',
            ],

        ],
    ],

    'settings' => [
        'name' => 'Theme settings',
        'model' => [
            'active' => [
                'name' => 'Activity',
                'comment' => 'On or Off this configuration',
            ],
            'name' => [
                'name' => 'Title',
                'comment' => 'Enter configuration name',
            ],
            'created_at' => [
                'name' => 'Date of creation',
                'comment' => 'Generated automatically',
            ],
            'site_name' => [
                'name' => 'Site name',
                'comment' => 'Will be displayed in the email',
            ],
            'tabs' => [
                'color' => 'Colors',
                'header' => 'Header',
                'footer' => 'Footer',
                'forms' => 'The form',
                'logos' => 'Logo and icon',
                'tag' => 'Tags',
            ],
            'color_main' => [
                'name' => 'Main color',
                'comment' => 'Select the main color of the site',
            ],
            'text_background' => [
                'name' => 'Background text color',
                'comment' => 'Select a text color on the site background.',
            ],
            'bgc_custom' => [
                'name' => 'Use your own background',
                'comment' => 'If you want to choose your background different from white',
            ],
            'bgc_custom_image' => [
                'name' => 'Use image',
                'comment' => 'If you want use image on the background',
            ],
            'bgc_custom_color' => [
                'name' => 'Background color',
                'comment' => 'The site background will be filled with the current color.',
            ],
            'bgc_custom_images' => [
                'name' => 'Image',
                'comment' => 'Upload an image to the site background',
            ],
            'bgc_custom_images_options' => [
                'name' => 'Image options',
                'comment' => 'Simple options for setting the background as an image',
                'options' => [
                    'center' => 'Center',
                    'repeat' => 'Do not multiply image',
                    'cover' => 'Stretch the entire site',
                ],
            ],
            'column_contact' => [
               'name' => 'Column contacts',
               'comment' => 'To display the contacts under each other',
            ],
            'contact_mail_active' => [
                'name' => 'Show Email',
                'comment' => 'Display Email in the site header and in the footer (if it is full)',
            ],
            'contact_mail' => [
                'name' => 'Email',
                'comment' => 'Enter the Email you want to display!',
            ],
            'contact_phone_active' => [
                'name' => 'Show Phone',
                'comment' => 'Display Phone in the site header and in the footer (if it is full)',
            ],
            'contact_phone' => [
                'name' => 'Phone',
                'comment' => 'Enter the phone number',
            ],
            'footer_small' => [
                'name' => 'Small footer',
                'comment' => 'Displays an abbreviated version of the basement',
            ],
            'footer_small_logo' => [
                'name' => 'Show logo',
                'comment' => 'Manages the display of the logo in the footer',
            ],
            'footer_date' => [
                'name' => 'Date',
                'comment' => 'Manages the display of the date in the footer',
            ],
            'footer_date_custom' => [
                'name' => 'Own date',
                'comment' => 'Allows you to set your date for example `1992-2016`',
            ],
            'footer_date_start' => [
                'name' => 'Start date',
                'comment' => 'Select the first date (only the year will be displayed!)',
            ],
            'footer_date_end' => [
                'name' => 'Final date',
                'comment' => 'Choose a second date (only the year will be displayed!)',
            ],
            'footer_text_rights' => [
                'name' => 'Text "All Rights Reserved"',
                'comment' => 'Specify your text if necessary (if you do not specify your text, the standard text will be displayed!)',
            ],
            's_admin_send' => [
                'name' => 'Send letters with applications',
                'comment' => 'Includes sending letters to the site administrator!',
            ],
            'emails' => [
                'name' => 'Email addresses',
                'email' => 'Email',
                'comment' => 'Enter email',
                'add' => 'Add email',
            ],
            'svg_logo' => [
                'name' => 'Use SVG type logo',
                'comment' => 'Choose a type of logo is recommended to use SVG',
            ],
            'favicon' => [
                'name' => 'Site favicon',
                'comment' => '(recommended to use for best effect max widht <= 100px and square images)',
            ],
            'img_logo' => [
                'name' => 'Logo is not SVG',
                'comment' => 'Upload png or jpg logo',
            ],
            'logo_filter' => [
                'name' => 'White logo filter',
                'comment' => 'Automatically makes PNG logo with transparent background white image',
            ],
            'svg_logo_code' => [
                'name' => 'SVG logo code',
                'comment' => 'Please note the code must start with <svg',
            ],
            'og_site_name' => 'Write the name of your site `landing page theme`',
            'og_title' => 'Write the name of your site `Landing page - created by October-studio.ru`',
            'og_type' => 'Write type `website`',
            'og_url' => 'Enter url `https://october-studio.ru`',
            'og_image' => '(recommended max widht <= 115px)',

            'section2' => 'Background',


        ],
    ],


];