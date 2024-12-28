import numpy as np
import matplotlib.pyplot as plt

# Create a sample matrix (e.g., an image or data matrix)
A = np.array([
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16]
], dtype=float)

# Perform Singular Value Decomposition
U, S, VT = np.linalg.svd(A, full_matrices=False)

# Convert singular values to a diagonal matrix
Sigma = np.diag(S)

# Function to reconstruct matrix with top k singular values
def reconstruct_matrix(U, Sigma, VT, k):
    U_k = U[:, :k]
    Sigma_k = Sigma[:k, :k]
    VT_k = VT[:k, :]
    return np.dot(U_k, np.dot(Sigma_k, VT_k))

# Specify the rank for compression
k = 2
A_k = reconstruct_matrix(U, Sigma, VT, k)

# Print the original and compressed matrices
print("Original Matrix:\n", A)
print("Reconstructed Matrix with k=", k, ":\n", A_k)

# Visualize the approximation error
error = np.linalg.norm(A - A_k, 'fro')
print("Frobenius Norm Error:", error)

# Example of applying this to an image
# Load a sample grayscale image (e.g., using matplotlib)
def compress_image(image, k):
    U, S, VT = np.linalg.svd(image, full_matrices=False)
    Sigma = np.diag(S)
    return reconstruct_matrix(U, Sigma, VT, k)

# Create a synthetic image (e.g., a gradient)
image = np.outer(np.linspace(0, 1, 100), np.linspace(0, 1, 100))

# Compress the image
compressed_image = compress_image(image, k=10)

# Display the original and compressed images
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.title("Original Image")
plt.imshow(image, cmap='gray')
plt.axis('off')

plt.subplot(1, 2, 2)
plt.title("Compressed Image (k=10)")
plt.imshow(compressed_image, cmap='gray')
plt.axis('off')

plt.show()
