Magnet (오토 레이아웃)
==============================

## 직관적인 오토레이아웃

### 특징

#### 1. No Library
#### 2. 직관적 사용
#### 3. 오픈 소스

<br>

### No Library, Just copy & paste code

[Magnet.swift 링크](https://github.com/KiwookJUNG/MagnetLayout/blob/master/MagnetLayout/Magnet/UIView%20%2B%20Extension.swift)

#### 1. 프로젝트에서 Magnet.swift 파일 생성

#### 2. 위의 링크에 접속해 소스코드 복사 및 붙여 넣기

#### 3. 메소드 사용(아래에 있는 사용법에 따라)

<br>

### 사용법

#### 1. 뷰의 전체에 Magnet 사용


#### 1-1. 슈퍼 뷰 전체에 Magnet 사용

```swift
       pinkView.magnet(.fillSuper())                               
```


<img width="200" alt="스크린샷 2020-01-16 오후 3 26 18" src="https://user-images.githubusercontent.com/47555993/72499219-8cee2300-3874-11ea-8372-bb6a73e774ba.png">

- fillSuper() 결과 화면


<br>
<br>

#### 1-2. 슈퍼 뷰 전체에 Magnet 사용 (원하는 만큼 거리 추가)

```swift
        pinkView.magnet(.fillSuper(.init(top: 30,
                                         left: 30,
                                         right: -30,
                                         bottom: -30)))                           
```


<img width="200" alt="스크린샷 2020-01-16 오후 3 37 47" src="https://user-images.githubusercontent.com/47555993/72499782-266a0480-3876-11ea-86dc-a4f56cc3765d.png">

- fillSuper() + padding 추가 결과화면

> **right와 bottom에는 - 연산자 사용** 
>
> right와 bottom은 - 연산자를 사용해서 padding을 줘야한다.
>



<br>
<br>

#### 1-3. SafeArea 전체에 Magnet 사용

```swift
       pinkView.magnet(.safeArea(.top),
                       .safeArea(.left),
                       .safeArea(.right),
                       .safeArea(.bottom))                               
```



<img width="200" alt="스크린샷 2020-01-16 오후 3 29 04" src="https://user-images.githubusercontent.com/47555993/72499360-efdfba00-3874-11ea-8b82-c60e2d73cae9.png">


- fillSafeArea() 결과화면 (간단하고 직관적인 메소드 구현 예정)

<br>
<br>
