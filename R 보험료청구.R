# -------------------------------------- #
# Fast campus X 임경덕                   #
# 데이터 분석 입문 올인원 패키지 Online  #
    
# =======혼자 해보는 데이터 분석======== #
# -------------------------------------- #



  #### 주제 3
  #### 보험료 청구 데이터 요약
    
    ## 개인 신상 및 건강 정보와 보험료 청구금액 데이터
    ## 출처 : kaggle(https://www.kaggle.com/mirichoi0218/insurance)



##0 데이터 불러오기

  # kaggle.com에서 직접 다운로드
    ## URL : https://www.kaggle.com/mirichoi0218/insurance


  # 다운로드한 파일을 강의자료의 data 폴더에 넣기



#### 여기서부터 실습 입니다 ####
 

##1 데이터 불러와서 insurance로 저장하기
  insurance=read.csv('data/insurance.csv')
  insurance
  attach(insurance)
  head(insurance)
  tail(insurance)
  class(insurance) #data frame
  factor(insurance)
  names(insurance) #열인덱스
  
##2 summary( )함수로 데이터 요약하고
##  수치형 변수는 히스토그램, 범주형 변수는 표 만들기
  summary(insurance)
  hist(age)
  hist(bmi)
  hist(children)
  hist(charges)
  data.frame(sex,smoker,charges,region) #()안의 변수들을 열벡터로 두는 표
  table(sex)
  table(smoker)
  table(charges)
  table(region)
  
  ##3 bmi와 charges의 산점도 그리고 상관계수 계산하기
  plot(bmi,charges,pch=16)
  plot(charges~bmi,pch=16)
  #plot(x축,y축) = plot(y축~x축)
  cor(bmi,charges) #상관계수

  
##4 region별 charges의 상자그림 그리고 그룹별 평균 계산하기
  boxplot(charges~region,insurance,pch=16)
  aggregate(charges~region,insurance,mean)



##5 lm( )과 rpart( )를 활용하여 
##  관심변수 charges를 나머지 변수로 설명하는 모형 적합하기 
  lm_ins=lm(charges~age+sex+bmi+children+smoker+region) lm(charges~.)이랑 같음
  summary(lm_ins)
  
  library(rpart) #rpart쓰려면 필수
  library(rpart.plot) #rpart.plot 쓰려면 필수
  r_ins=rpart(charges~.,insurance)
  tree_ins=rpart.plot(r_ins)

# End of script