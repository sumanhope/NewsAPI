# NewsAPI

**Description**

NewsAPI is a Flutter application that provides users with the latest news and allows them to add articles to their favorites. The app features a sleek user interface with a focus on usability and responsiveness. This app uses GetX for State Management and Get Storage(local storage) for database. 

**Features**

- **BBC Top Three News**: Displays the top three news articles from BBC, presented in a horizontal carousel.
- **Five Categories of News**: Provides news articles across five different categories, displayed in vertically scrollable tabs.
- **Favorites**: Allows users to add and manage their favorite articles.
- **Dark Mode**: Users can toggle between light and dark themes for a better reading experience in different lighting conditions.

**How to Use**

- **Onboarding Screen**: When opening the app for the first time, the user is greeted with a welcome message and an elevated button labeled "CONTINUE."
- **Navigation to Home Screen**: Clicking the "CONTINUE" button navigates the user to the Home Screen.
- **Home Screen**:
  - **Top News Carousel**: The top three BBC news articles can be slid horizontally.
  - **Category Heading**: Clicking on View all will automatically scroll screen to Category Tabs.
  - **Category Tabs**: Five categories of news are presented in vertically scrollable tabs.
  - **Theme Switch**: An icon button in the app bar allows users to switch between light and dark themes.
- **Article Details**:
  - **Navigation**: Clicking on any news container navigates the user to the Article Details page.
  - **Content Display**: The Article Details page displays the article's title, author, published time, image, description, and content.
  - **Favorite Button**: An icon button on the app bar allows users to add or remove the article from their favorites.
  - **Continue Reading**: An elevated button labeled "CONTINUE READING" opens the full article in a browser.
- **Favorites Screen**:
  - **Access**: Users can access the Favorites screen through the bottom navigation bar.
  - **Favorite Articles**: Displays the user's favorite articles. Clicking on an article navigates to the Article Details screen.
  - **No Favorites**: If there are no favorite articles, instructions are displayed on how to add articles to favorites.
  - **Add to Favorites**: To add an article to favorites, navigate to the Article Details page of that particular article and click the outline favorite icon, which will change to filled icon and also display a snackbar notification.
  - **Remove from Favorites**: To remove an article from favorites, navigate to the Article Details page of that particular article and click the filled favorite icon, which will change to an outline and also display a snackbar notification.

**Packages & Installation**

1. **icons_plus**
   ```bash
   flutter pub add icons_plus
   ```
2. **google_nav_bar**
   ```bash
   flutter pub add google_nav_bar
   ```
3. **get**
   ```bash
   flutter pub add get
   ```
4. **getwidget**
   ```bash
   flutter pub add getwidget
   ```
5. **intl**
   ```bash
   flutter pub add intl
   ```
6. **connectivity_plus**
   ```bash
   flutter pub add connectivity_plus
   ```
7. **http**
   ```bash
   flutter pub add http
   ```
8. **url_launcher**
   ```bash
   flutter pub add url_launcher
   ```
9. **get_storage**
   ```bash
   flutter pub add get_storage
   ```
10. **skeletonizer**
    ```bash
    flutter pub add skeletonizer
    ```

**Fonts**

- **Poppins**: The application uses the Poppins font for a modern and clean look.

**Additional Features**

- **Loading Indicators**: Skeleton loaders are used to indicate loading states for a smoother user experience.
- **Error Handling**: Graceful handling of network errors and connectivity issues with user-friendly messages.

**Development Setup**

- Clone the repository:
  ```bash
  git clone https://github.com/yourusername/NewsAPI.git
  ```
- Navigate to the project directory:
  ```bash
  cd newsapi
  ```
- Install dependencies:
  ```bash
  flutter pub get
  ```
- Run the application:
  ```bash
  flutter run
  ```
