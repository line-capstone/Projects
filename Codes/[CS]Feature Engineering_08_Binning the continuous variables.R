## -- Outbrain Click Prediction 연속형 변수 Quantile 구하기

# 경로 설정
setwd('F:/Outbrain Click Prediction')

# 필요한 패키지 로드 
library(data.table)
library(OneR)

# 데이터 로드
train <- fread('calculating_continuous.csv') 

# 변수명 확인
names(train)

## 1) 변수별 Q1(25%), Q2(50%), Q3(75%) 값 구하기

## -- pop_ad_id
# Q1: 0.094, Q2: 0.169, Q3: 0.266
quantile(train$pop_ad_id, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

## -- pop_ad_doc_id
# Q1: 0.098, Q2: 0.170, Q3: 0.262
quantile(train$pop_ad_doc_id, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

## -- pop_ad_publisher_id
# Q1: 0.111, Q2: 0.178, Q3: 0.257
quantile(train$pop_ad_publisher_id, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

## -- pop_ad_advertiser_id
# Q1: 0.109, Q2: 0.177, Q3: 0.258
quantile(train$pop_advertiser_id, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

## -- pop_campaign_id
# Q1: 0.098, Q2: 0.174, Q3: 0.258
quantile(train$pop_campaign_id, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

## -- pop_view_doc_ad_doc
# Q1: 0.067, Q2: 0.154, Q3: 0.290
quantile(train$pop_view_doc_ad_doc, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

## -- pop_ad_source_id
# Q1: 0.111, Q2: 0.177, Q3: 0.256
quantile(train$pop_ad_source_id, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

## -- pop_ad_topic_id
# Q1: 0.177, Q2: 0.199, Q3: 0.217
quantile(train$pop_ad_topic_id, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

## -- pop_ad_category_id
# Q1: 0.168, Q2: 0.204, Q3: 0.227
quantile(train$pop_ad_category_id, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)


## 2) Smarter way: using OneR Package

train_bin <- bin(train, nbins = 4, method = 'content', na.omit = FALSE, # 결측치는 NA 레벨로 생성
                 labels = c('1', '2', '3', '4'))

write_csv(train_bin, 'train_bin.csv')