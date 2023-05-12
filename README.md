## HandyGPT

### A Chat-GPT Helper App works on Apple Watch

Apple Watch를 이용하여 Chat-GPT를 편하게 사용해요.

---

### 기능 소개

#### iPhone
- API Key를 등록하여 Apple Watch에 전송합니다.
- Open AI의 GPT API에 대한 Parameter를 설정하고, 기억합니다.
<img src="https://github.com/L-j-h-c/HandyGPT/assets/77208067/eb80be34-441c-462c-922f-2b6eb68ac21d" width=300/>

#### Watch App
- iPhone App에서 GPT-3.5의 API Parameter를 받아서 사용합니다.
<img src="https://github.com/L-j-h-c/HandyGPT/assets/77208067/d6779ade-bec1-4b06-9fa9-b7b100874d30" width=200/>
<img src="https://github.com/L-j-h-c/HandyGPT/assets/77208067/c7132039-45eb-4f26-97ed-db99e8169e4c" width=200/>
<img src="https://github.com/L-j-h-c/HandyGPT/assets/77208067/0320b4b9-fde3-4232-9f82-8f54440e5bcc" width=200/> <br>

- Watch App을 사용하면, 단축어 및 Hand Gesture를 이용하여 GPT-3.5를 편리하게 이용할 수 있습니다.

---

### 🛠 개발 환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.8-orange)]() [![swiftUI](https://img.shields.io/badge/swiftUI-3.0-orange)]() [![xcode](https://img.shields.io/badge/Xcode-14.2-blue)]()

<br>

### 🏡 Skills

#### SwiftUI
- SwiftUI로 ChatBot의 UI를 구현합니다.

#### SPM
- SPM을 이용하여 WatchOS 및 iOS Target에 소스 코드를 공유했습니다.
- 전처리문을 사용하여 OS별 구현을 분기했습니다.

#### Watch Connectivity
- Watch Connectivity를 이용하여 Watch App 및 iPhone App 간의 동기화를 수행했습니다.
- API Key 및 Open AI API의 Parameters의 context를 공유하기 위해 사용합니다.
