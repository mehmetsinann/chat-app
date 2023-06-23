# Chat Application

This web application allows users to engage in private chat conversations with active users and participate in public chat rooms. The application is developed using Ruby on Rails.

## Features

Private Chat: Users can view a list of active users and initiate private chat conversations with them.
Public Chat Rooms: Users can join public chat rooms and participate in group chat discussions.
Real-Time Messaging: The application utilizes real-time messaging to provide instant communication between users.
User Authentication: Users can create accounts, log in, and customize their profile.

## Installation

To run the application locally, follow these steps:

1. Clone the repository: `git clone https://github.com/mehmetsinann/chat-app.git`
2. Navigate to the project directory: `cd chat-app`
3. Install the necessary dependencies: `bundle install`
4. Set up the database: `rails db:create` and `rails db:migrate`
5. Start the Rails server: `rails server`
6. Open your browser and visit: `http://localhost:3000`

## Usage

1. Upon opening the application, you will be presented with two tabs: "Private Chat" and "Public Chat Rooms".
2. Select the "Private Chat" tab to view a list of active users who are currently available for private conversations.
3. Click on a user's name to initiate a private chat with them. The chat interface will open, allowing you to exchange messages in real time.
4. Select the "Public Chat Rooms" tab to view a list of available chat rooms.
5. Click on a chat room to join and participate in the group chat discussion.
6. In both private and public chats, you can send messages, view message history, and interact with other users.

## Contributing

Contributions are welcome! If you would like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Make your changes and commit them: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Submit a pull request.
