import SwiftUI

struct FormulaRow: View {
    var formula: Formula?
    
    var body: some View {
        
            HStack {
               
                if let imageUrl = formula?.imageUrl, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 130, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .clipped()
                        } else if phase.error != nil {
                            Image(systemName: "questionmark.diamond")
                                .imageScale(.large)
                                .frame(width: 130, height: 100)
                                .background(Color.gray.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        } else {
                            ProgressView()
                                .frame(width: 130, height: 100)
                                .background(Color.gray.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 130, height: 100)
                        .background(Color.gray.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                ContentIconLabel(formula: formula)
                    .padding(.leading, 10)
                    .aspectRatio(CGSize(width: 0.4, height: 1), contentMode: .fill)
                
                Spacer()
            }
//            .frame(width:)
            .padding(.vertical, 10)
            .padding(.leading, 13)
            .background(Color.white.opacity(0.09))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        
}

#Preview(traits: .sizeThatFitsLayout) {
    FormulaRow(formula: MockFormulaModel.getMockFormulas()[0])
}
