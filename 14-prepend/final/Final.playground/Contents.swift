import UIKit
import Combine

var subscriptions = Set<AnyCancellable>()

// MARK: - Prepending

example(of: "prepend(Output...)") {
  let publisher = [3, 4].publisher

  publisher
    .prepend(1, 2)
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}

example(of: "prepend(Sequence)") {
  let publisher = [5, 6, 7].publisher

  publisher
    .prepend([3, 4])
    .prepend(Set(1...2))
    .prepend(stride(from: 6, to: 11, by: 2))
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}

example(of: "prepend(Publisher)") {
  let publisher1 = [3, 4].publisher
  let publisher2 = [1, 2].publisher

  publisher1
    .prepend(publisher2)
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}

example(of: "prepend(Publisher) #2") {
  let publisher1 = [3, 4].publisher
  let publisher2 = PassthroughSubject<Int, Never>()

  publisher1
    .prepend(publisher2)
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)

  publisher2.send(1)
  publisher2.send(2)
  publisher2.send(completion: .finished)
}

// Copyright (c) 2019 Razeware LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
