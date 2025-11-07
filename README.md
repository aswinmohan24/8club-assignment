# Host Onboarding Questionnaire (Flutter Internship Assignment)

The UI and state management are built using **Flutter**, **Riverpod**, and **ScreenUtil** for responsive design. The design is derived from the provided Figma file, with attention to visual accuracy and smooth interactions.

---

## 🚀 Features Implemented

### 1. Experience Selection Screen
- Fetches and displays experience types from API using **Dio**.
- Each experience is shown as a card with:
  - Grayscale → Color on selection
  - Multi-select support
- Multi-line description input with a **250 character limit**
- Selected experience IDs and input text stored in state
- Validations + smooth UI spacing + consistent typography
- Navigates to next onboarding step after selection

### 2. Onboarding Question Screen
- Multi-line input field with **600 character limit**
- UI layout adapts dynamically to keyboard & device height
- Audio  recording UI elements placed as per design
- 
- Option to delete and re-record media

---

## ⭐ Brownie Points (Enhancements Implemented)

| Enhancement | Status |
|------------|--------|
| Pixel-perfect styling based on Figma
| Responsive UI using `flutter_screenutil`
| State Management using **Riverpod** 
| Smooth animated reordering experience images
| Light radial gradient + blur background effects 

---

## 🎨 Additional Improvements

- Centralized design system (`AppColors`, `AppText`, `AppSpacing`)
- Reusable components for better maintainability
- Clean folder structure for scalability:
