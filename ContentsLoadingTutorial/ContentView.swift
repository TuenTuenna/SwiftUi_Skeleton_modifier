import SwiftUI

struct BlogPost {
    
    let title: String
    let author: String
    let article: String
    
    static func getDummy() -> BlogPost{
        return BlogPost(title: "오늘도 빡코딩!🔥👨‍💻", author: "쩡대리", article: "지혜는 소리다.이것은 같으며, 때까지 평화스러운 자신과 별과 행복스럽고 교향악이다. 주는 듣기만 찾아 부패를 눈에 몸이 새 것이다. 동산에는 용감하고 타오르고 풀이 청춘 커다란 봄바람을 그들에게 아름다우냐? 물방아 어디 예가 얼음 설레는 사랑의 꾸며 인간에 역사를 사막이다. 이 그들의 내는 청춘이 청춘의 수 하는 희망의 약동하다. 그들은 발휘하기 품었기 오직 그들의 붙잡아 듣기만 새가 쓸쓸하랴? 피어나는 행복스럽고 영락과 스며들어 피부가 청춘은 대한 끓는 쓸쓸하랴? 피어나기 무엇이 장식하는 길을 청춘의 뿐이다. 풀이 않는 천지는 것이다. 위하여서 없으면, 그들의 새 이상이 그림자는 싸인 대고, 투명하되 황금시대다.")
    }
}

struct ContentView: View {
    
    @State var post: BlogPost?
    
    @State var isLoading: Bool = false
    
    @State var opacity : Double = 1.0
    
    var body: some View {
        
            VStack(alignment: .leading, spacing: 0) {
                
                Image("cat")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .clipped()
                    .frame(width: 60, height: 60)
                    .setSkeletonView(opacity: opacity, shouldShow: post == nil)
                    .padding(.bottom, 15)
                    
                
                Text(post?.title ?? "포스트 타이틀이 없습니다.")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .setSkeletonView(opacity: opacity, shouldShow: post == nil)
                    .padding(.bottom, 8)
                
                
                Text(post?.author ?? "포스트 작가입니다.")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .setSkeletonView(opacity: opacity, shouldShow: post == nil)
                    .padding(.bottom, 30)
                    
                
                Text(post?.article ?? "끓는 불러 동산에는 교향악이다. 심장은 주는 어디 미인을 방황하여도, 부패뿐이다. 대한 옷을 하는 끝에 방지하는 속에 가지에 놀이 끓는 끓는다. 꽃이 소담스러운 소금이라 얼음이 말이다. 방지하는 가진 작고 그러므로 밝은 꽃 방황하여도, 뜨거운지라, 부패를 말이다. 있으며, 만물은 기쁘며, 그들의 공자는 싸인 구하지 봄바람이다. 뜨거운지라, 불러 원대하고, 못할 있는 것이다. 희망의 살 굳세게 사는가 영원히 밝은 속에서 위하여, 사막이다. 사람은 밥을 인류의 철환하였는가?")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .setSkeletonView(opacity: opacity, shouldShow: post == nil)
                    
                
                Spacer()
                
                Button(action: reloadData, label: {
                    Image(systemName: "repeat")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(.blue))
                })
//                .unredacted()
                
                Spacer()
            }
//            .redacted(reason: post == nil ? .placeholder : [])
            .padding(.horizontal, 20)
//            .overlay(loadingView.opacity(isLoading ? 1 : 0))
            .onAppear(perform: {
                self.post = BlogPost.getDummy()
                withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: true)) {
//                    if opacity == 0.4 {
//                        opacity = 0.8
//                    } else {
//                        opacity = 0.4
//                    }
                    self.opacity = opacity == 0.4 ? 0.8 : 0.4
                }
            })
    }
    
}

extension ContentView {
    fileprivate var loadingView : some View {
        Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
            .overlay(ProgressView().tint(.white))
    }
}

//MARK: - Helper
extension ContentView {
    
    // 데이터 갱신
    fileprivate func reloadData(){
        self.post = nil
        
        withAnimation{self.isLoading = true}
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            
            withAnimation{self.post = BlogPost.getDummy()}
            
            
//            withAnimation{self.isLoading = false}
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
