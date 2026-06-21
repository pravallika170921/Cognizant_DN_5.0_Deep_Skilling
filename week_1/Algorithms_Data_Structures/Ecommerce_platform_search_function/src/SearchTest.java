public class SearchTest {

    public static void main(String[] args) {

        Product[] products = {

                new Product(101, "Poco M6 plus", "Electronics"),
                new Product(102, "Google ", "Electronics"),
                new Product(103, "Lenovo Laptop", "Computers"),
                new Product(104, "HushPuppies Shoes", "Footwear")

        };

        System.out.println("Linear Search");

        Product linearResult =
                SearchUtils.linearSearch(products, "HushPuppies Shoes");

        if (linearResult != null) {

            System.out.println("Found: "
                    + linearResult.getProductName());

        } else {

            System.out.println("Product not found.");
        }

        System.out.println("\nBinary Search");

        Product binaryResult =
                SearchUtils.binarySearch(products, "Lenovo Laptop");

        if (binaryResult != null) {

            System.out.println("Found: "
                    + binaryResult.getProductName());

        } else {

            System.out.println("Product not found.");
        }
    }
}
