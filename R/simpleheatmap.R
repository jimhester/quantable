#' heatmap2 facade
#' @export
#' @param pln or dataframe with numerical values
#' @param distf distance function
#' @param hclustf clustering function
#' @param palette color palette
#' @param main title
#' @param labRow row labels
#' @param margins control margins of heatmap
#' @param ... other parameters to heatmap.2
#' @examples
#' tmp = matrix(rep((1:100),times = 4) + rnorm(100*4,0,3),ncol=4)
#' mean = c(20,30,10,40)
#' sd = c(4,3,4,5)
#' tmp = sweep(tmp,2,sd,"*")
#' tmp = sweep(tmp,2,mean,"+")
#' par(mar=c(5,5,5,5))
#' simpleheatmap(tmp,ColSideColors=c("red","blue","pink","black"))
#' simpleheatmap(tmp)
simpleheatmap <- function(pln,
                         main="",
                         distf=dist,
                         hclustf=hclust,
                         labRow="",
                         palette=getBlueWhiteRed(),
                         margins=c(5,5),...)
{
  heatmap.2( as.matrix(pln) , trace="none" , scale="none" , col=palette ,
                    labRow=labRow,
                    cexRow=0.1 + 1/log10(dim(pln)[1]),
                    cexCol=0.1 + 1/log10(dim(pln)[2]),
                    distfun=distf,hclustfun=hclustf,
                    margins=margins,main=main,...=...)
 
}
