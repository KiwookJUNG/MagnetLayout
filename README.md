Magnet (오토 레이아웃)
==============================

## 직관적인 오토레이아웃

### 특징

#### 1. No Library
#### 2. 직관적 사용



### 사용법

#### 1. 뷰의 전체에 Magnet 사용


#### 1-1. 슈퍼 뷰 전체에 Magnet 사용
```swift
       pinkView.magnet(.fillSuper())                               
```


<img width="200" alt="스크린샷 2020-01-16 오후 3 26 18" src="https://user-images.githubusercontent.com/47555993/72499219-8cee2300-3874-11ea-8372-bb6a73e774ba.png">

- fillSuper() 결과 화면

#### 1-2. SafeArea 전체에 Magnet 사용

```swift
       pinkView.magnet(.safeArea(.top),
                       .safeArea(.left),
                       .safeArea(.right),
                       .safeArea(.bottom))                               
```



<img width="200" alt="스크린샷 2020-01-16 오후 3 29 04" src="https://user-images.githubusercontent.com/47555993/72499360-efdfba00-3874-11ea-8b82-c60e2d73cae9.png">


- fillSafeArea() 결과화면 (간단하고 직관적인 메소드 구현 예정)

